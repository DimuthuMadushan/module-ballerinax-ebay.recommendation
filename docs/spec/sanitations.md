_Author_:  @DimuthuMadushan \
_Created_: 2026/10/22 \
_Updated_: 2026/10/22 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from eBay Recommendation. 
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/ebay/recommendation/v1.1.0/openapi.json).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Rewrote `info.description` as a short plain-text summary (no HTML), so that it can serve as the `Client` class documentation. This change was made in the original specification `docs/spec/openapi.json`.

2. Added the missing `summary` ("Find listing recommendations") to the `findListingRecommendations` operation (`POST /find`). This change was made in the original specification `docs/spec/openapi.json`.
3. Replaced the templated server URL (`https://api.ebay.com{basePath}` with a `basePath` variable) by the concrete production URL `https://api.ebay.com/sell/recommendation/v1`. This change was made in the original specification `docs/spec/openapi.json`.

4. Replaced the generic `200` response description "Success" of `findListingRecommendations` with "A paginated collection of listing recommendations". This change was made in the original specification `docs/spec/openapi.json`.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json --mode client -o ballerina --client-methods remote --license docs/license.txt
```

Note: The license year is hardcoded to 2026, change if necessary.
