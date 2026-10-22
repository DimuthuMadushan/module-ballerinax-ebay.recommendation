## Overview

The eBay Recommendation connector lets Ballerina applications call the [eBay Recommendation API](https://developer.ebay.com/api-docs/sell/recommendation/overview.html) to retrieve information that sellers can use to optimize their listings. It supports version v1.1.0 of the API, and currently exposes the find listing recommendations operation, which returns Promoted Listings ad recommendations and trending bid percentages for a seller's active listings.

### Key features

- Find Promoted Listings ad recommendations for all active listings or a chosen set of listing IDs
- Retrieve the trending ad rate (bid percentage) for recommended listings
- Page through large result sets using the limit and offset query parameters
- Authenticate with an OAuth 2.0 refresh token grant or a bearer token

## Setup guide

To use the eBay Recommendation connector, you need an eBay developer account and an OAuth access to the seller's inventory scope.

1. Create an eBay developer account and a keyset (application) in the [eBay Developer Program](https://developer.ebay.com/).

2. Obtain a user access token or refresh token through the OAuth 2.0 authorization code grant, with the `https://api.ebay.com/oauth/api_scope/sell.inventory` scope.

3. Note the client ID, client secret and refresh token, or the access token, to use when initializing the client.

## Quickstart

To use the `ebay.recommendation` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerinax/ebay.recommendation;
```

### Step 2: Instantiate a new connector

Create a `Config.toml` file with your credentials:

```toml
clientId = "<CLIENT_ID>"
clientSecret = "<CLIENT_SECRET>"
refreshToken = "<REFRESH_TOKEN>"
```

Then create a `recommendation:Client` using them:

```ballerina
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;

final recommendation:Client ebay = check new ({
    auth: {
        clientId,
        clientSecret,
        refreshToken
    }
});
```

### Step 3: Invoke the connector operation

```ballerina
public function main() returns error? {
    recommendation:PagedListingRecommendationCollection? _ = check ebay->findListingRecommendations(
        {xEBAYCMARKETPLACEID: "EBAY_US"},
        {listingIds: ["110501234567"]}
    );
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `eBay Recommendation` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-ebay.recommendation/tree/main/examples/), covering the following use cases:

1. [Promoted listing picks](../examples/promoted_listing_picks/promoted_listing_picks.md) - Review selected listings and report those recommended for a Promoted Listings campaign.
2. [Ad rate benchmark](../examples/ad_rate_benchmark/ad_rate_benchmark.md) - Page through all active listings and compute the average trending ad rate.

