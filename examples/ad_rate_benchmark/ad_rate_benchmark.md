# Ad rate benchmark

This example pages through all of a seller's active listings and computes the average trending ad rate across the listings that have a recommended bid percentage.

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
