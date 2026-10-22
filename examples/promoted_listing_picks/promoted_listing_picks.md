# Promoted listing picks

This example reviews a chosen set of listing IDs and prints the listings that eBay recommends for a Promoted Listings ad campaign, together with the suggested ad rate.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- An eBay developer keyset and a refresh token with the `https://api.ebay.com/oauth/api_scope/sell.inventory` scope
- Create a `Config.toml` in this directory:
  ```toml
  clientId = "<CLIENT_ID>"
  clientSecret = "<CLIENT_SECRET>"
  refreshToken = "<REFRESH_TOKEN>"
  marketplaceId = "EBAY_US"
  listingIds = ["<LISTING_ID_1>", "<LISTING_ID_2>"]
  ```

## Run the example

```bash
bal run
```
