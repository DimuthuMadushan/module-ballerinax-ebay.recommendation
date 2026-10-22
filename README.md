# Ballerina eBay Recommendation connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-ebay.recommendation/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-ebay.recommendation/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-ebay.recommendation.svg)](https://github.com/ballerina-platform/module-ballerinax-ebay.recommendation/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/ebay.recommendation.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Febay.recommendation)

## Overview

The eBay Recommendation connector lets Ballerina applications call the [eBay Recommendation API](https://developer.ebay.com/api-docs/sell/recommendation/overview.html) to retrieve information that sellers can use to optimize their listings. It supports version v1.1.0 of the API, and currently exposes the find listing recommendations operation, which returns Promoted Listings ad recommendations and trending bid percentages for a seller's active listings.

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

1. [Promoted listing picks](examples/promoted_listing_picks/promoted_listing_picks.md) - Review selected listings and report those recommended for a Promoted Listings campaign.
2. [Ad rate benchmark](examples/ad_rate_benchmark/ad_rate_benchmark.md) - Page through all active listings and compute the average trending ad rate.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`ebay.recommendation` package](https://central.ballerina.io/ballerinax/ebay.recommendation/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
