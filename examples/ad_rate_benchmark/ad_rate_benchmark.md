# Ad rate benchmark

This example pages through the seller's active listings that eBay recommends for promotion and computes their average `TRENDING` ad rate. With an empty request body, eBay considers all active listings but returns only those whose `promoteWithAd` is `RECOMMENDED`. `pageSize` must be between 1 and 500.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- An eBay developer keyset and a refresh token with the `https://api.ebay.com/oauth/api_scope/sell.inventory` scope
- Create a `Config.toml` in this directory:
  ```toml
  clientId = "<CLIENT_ID>"
  clientSecret = "<CLIENT_SECRET>"
  refreshToken = "<REFRESH_TOKEN>"
  marketplaceId = "EBAY_US"
  pageSize = 50
  ```

## Run the example

```bash
bal run
```
