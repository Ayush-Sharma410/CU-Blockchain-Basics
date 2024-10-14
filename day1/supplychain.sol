// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    struct Product {
        uint id;
        string name;
        string origin;
        string destination;
    }

    mapping(uint => Product) public products; // Mapping from ID to Product
    uint public productCount = 0; // Keep track of the number of products

    // Function to add a product
    function addProduct(string memory name, string memory origin, string memory destination) public {
        products[productCount] = Product(productCount, name, origin, destination);
        productCount++; // Increment product count after adding a new product
    }

    // Function to retrieve a product by ID
    function getProduct(uint id) public view returns (string memory name, string memory origin, string memory destination) {
        require(id < productCount, "Product does not exist"); // Ensure the product exists
        Product memory product = products[id];
        return (product.name, product.origin, product.destination);
    }

    // Function to get the total number of products
    function getProductCount() public view returns (uint) {
        return productCount;
    }
}
