// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.ebay.com/sell/recommendation/v1" : "http://localhost:9090";
final string token = isLiveServer ? os:getEnv("EBAY_ACCESS_TOKEN") : "test_token";
final string marketplaceId = isLiveServer ? os:getEnv("EBAY_MARKETPLACE_ID") : "EBAY_US";
// Live runs read comma-separated IDs of the authenticated seller's active listings from EBAY_LISTING_IDS.
final string[] & readonly listingIds = isLiveServer
    ? re `,`.split(os:getEnv("EBAY_LISTING_IDS")).'map(id => id.trim()).filter(id => id != "").cloneReadOnly()
    : ["110501234567", "110507654321"];

final Client ebay = check new ({
    auth: {token},
    httpVersion: isLiveServer ? http:HTTP_2_0 : http:HTTP_1_1
}, serviceUrl);

@test:Config {groups: ["mock_tests"], enable: !isLiveServer}
isolated function testFindListingRecommendations() returns error? {
    check assertFindListingRecommendations();
}

@test:Config {groups: ["live_tests"], enable: isLiveServer}
isolated function testFindListingRecommendationsLive() returns error? {
    test:assertTrue(listingIds.length() > 0, "Set EBAY_LISTING_IDS to the seller's active listing IDs");
    check assertFindListingRecommendations();
}

isolated function assertFindListingRecommendations() returns error? {
    PagedListingRecommendationCollection? response = check ebay->findListingRecommendations(
        {xEBAYCMARKETPLACEID: marketplaceId},
        {listingIds}
    );
    test:assertTrue(response?.listingRecommendations !is ());
}
