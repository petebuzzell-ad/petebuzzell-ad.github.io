#!/bin/bash

dotnet restore

#publish lambdas
export PATH="$PATH:/root/.dotnet/tools"
(cd src/Brighton.ShopifyMiddleware.AWS/; ./build.sh)

#publish inventory feed app
(cd Brighton.ShopifyMiddleware.InventoryFeedConsoleApp/; ./build.sh)

#publish salsify inventory feed app
(cd Brighton.ShopifyMiddleware.SalsifyInventoryFeedConsoleApp/; ./build.sh)

#publish product feed app
(cd Brighton.ShopifyMiddleware.ProductFeedConsoleApp/; ./build.sh)
