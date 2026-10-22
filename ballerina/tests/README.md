# Tests

The test suite covers the `findListingRecommendations` operation against a mock server.

## Running Tests

```bash
bal test
```

By default the tests run against the mock server (`tests/mock_service.bal`), so no real credentials are required. To run against the live eBay API, set `IS_LIVE_SERVER=true` together with `EBAY_ACCESS_TOKEN`, `EBAY_MARKETPLACE_ID` and `EBAY_LISTING_IDS`, and select the `live_tests` group (`bal test --groups live_tests`). `EBAY_LISTING_IDS` is a comma-separated list of IDs that must belong to the authenticated seller's active listings. The `live_tests` group is disabled unless `IS_LIVE_SERVER=true`, so it never runs against the mock server.
