// Page through the active listings eBay recommends for promotion and compute their average trending ad rate.
// An empty request body targets all active listings, but eBay returns only those with promoteWithAd = RECOMMENDED.

import ballerina/io;
import ballerinax/ebay.recommendation;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string marketplaceId = ?;
configurable int pageSize = 50;

public function main() returns error? {
    if pageSize < 1 || pageSize > 500 {
        return error(string `pageSize must be between 1 and 500, got ${pageSize}`);
    }
    recommendation:Client ebay = check new ({
        auth: {
            clientId,
            clientSecret,
            refreshToken
        }
    });

    int offset = 0;
    int recommended = 0;
    decimal rateTotal = 0d;
    while true {
        recommendation:PagedListingRecommendationCollection? page = check ebay->findListingRecommendations(
            {xEBAYCMARKETPLACEID: marketplaceId},
            {},
            'limit = pageSize.toString(),
            offset = offset.toString()
        );
        recommendation:ListingRecommendation[] items = page?.listingRecommendations ?: [];
        foreach recommendation:ListingRecommendation item in items {
            recommendation:BidPercentages[] trending = from recommendation:BidPercentages bid
                in item?.marketing?.ad?.bidPercentages ?: []
                where bid?.basis == "TRENDING"
                select bid;
            if trending.length() == 0 {
                continue;
            }
            string? value = trending[0]?.value;
            if value is string {
                recommended += 1;
                rateTotal += check decimal:fromString(value);
            }
        }
        if items.length() < pageSize {
            break;
        }
        offset += pageSize;
    }

    if recommended == 0 {
        io:println("No listings with a recommended ad rate were found.");
        return;
    }
    io:println(string `Listings with a recommended ad rate: ${recommended}`);
    io:println(string `Average trending ad rate: ${rateTotal / <decimal>recommended}%`);
}
