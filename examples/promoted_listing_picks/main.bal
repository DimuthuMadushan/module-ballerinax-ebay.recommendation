// Review a chosen set of listings and report the ones eBay recommends for a Promoted Listings campaign.

import ballerina/io;
import ballerinax/ebay.recommendation;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string marketplaceId = ?;
configurable string[] listingIds = ?;

public function main() returns error? {
    recommendation:Client ebay = check new ({
        auth: {
            clientId,
            clientSecret,
            refreshToken
        }
    });

    recommendation:PagedListingRecommendationCollection? result = check ebay->findListingRecommendations(
        {xEBAYCMARKETPLACEID: marketplaceId},
        {listingIds}
    );
    if result is () {
        io:println("No recommendations were returned for the given listings.");
        return;
    }

    recommendation:ListingRecommendation[] recommendations = result?.listingRecommendations ?: [];
    foreach recommendation:ListingRecommendation item in recommendations {
        recommendation:Ad? ad = item?.marketing?.ad;
        if ad is () || ad?.promoteWithAd != "RECOMMENDED" {
            continue;
        }
        recommendation:BidPercentages[] bids = ad?.bidPercentages ?: [];
        string rate = bids.length() > 0 ? (bids[0]?.value ?: "unknown") : "unknown";
        io:println(string `Listing ${item?.listingId ?: "?"}: promoteWithAd=${ad?.promoteWithAd ?: "?"}, suggested ad rate=${rate}`);
    }
}
