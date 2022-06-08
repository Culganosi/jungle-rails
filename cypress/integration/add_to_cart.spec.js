describe('displays Jungle Home page', () => {
  it('displays jungle home page', () => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 11);
  });

  it("should have the product be clickable and render product detail page ", () => {
    cy.get(".products article > a > img").first().click();

    cy.get(".product-detail")
  });

  it("can add products to the cart", () => {
    cy.get("button").contains("Add").first().click()
  });
});