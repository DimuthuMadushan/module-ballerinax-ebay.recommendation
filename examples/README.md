# Examples

The `ballerinax/ebay.recommendation` connector provides practical examples illustrating usage in various scenarios.

1. [Promoted listing picks](./promoted_listing_picks/promoted_listing_picks.md) - Review selected listings and report those recommended for a Promoted Listings campaign.
2. [Ad rate benchmark](./ad_rate_benchmark/ad_rate_benchmark.md) - Page through all active listings and compute the average trending ad rate.

## Prerequisites

- An eBay developer keyset and a refresh token with the `https://api.ebay.com/oauth/api_scope/sell.inventory` scope.
- A `Config.toml` in the example directory with the credentials and values described in the example's guide.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
