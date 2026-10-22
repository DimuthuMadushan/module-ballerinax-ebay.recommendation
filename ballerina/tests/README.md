# Tests

The test suite covers the `findListingRecommendations` operation against a mock server.

## Running Tests

```bash
bal test
```

By default the tests run against the mock server (`tests/mock_service.bal`), so no real credentials are required. To run against the live eBay API, set `IS_LIVE_SERVER=true` together with `EBAY_ACCESS_TOKEN` and `EBAY_MARKETPLACE_ID`.
