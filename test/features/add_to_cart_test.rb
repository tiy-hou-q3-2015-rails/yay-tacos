require "test_helper"

class AddToCartTest < Capybara::Rails::TestCase

  setup do
    @user = User.create! email: "bob@example.com", first_name: "Bob", last_name: "Not Happy", password: "12345678"

    # actions
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "12345678"
    click_button "Sign In"
  end

  test "Can remove from cart" do
    pastor = Taco.create! name: "Tacos al Pastor", photo: "http://cdn.funcheap.com/wp-content/uploads/2013/04/Tacos-al-Pastor1.jpg", price: 5, description: "Al pastor (from Spanish, lit. In the style of the shepherd) is a dish developed in Central Mexico, likely as a result of the adoption of the shawarma spit-grilled meat brought by Lebanese immigrants to Mexico.[1] Being derived from shawarma, it is also similar to the Turkish doner kebab and the Greek gyros. Whereas shawarma is usually lamb-based (thus the \"shepherd style\" name), gyros and tacos al pastor in Mexico are made from pork."
    barbacoa = Taco.create! name: "Barbacoa", photo: "http://www.seriouseats.com/images/2012/04/20120423-barbacoa-tacos-primary.jpg", price: 3, description: "Barbacoa (About this sound barba'koa (help·info)) is a form of cooking meat that originated in the Caribbean with the Taíno people, from which the term “barbecue” derives.[1] In contemporary Mexico, it generally refers to meats or whole sheep slow-cooked over an open fire, or more traditionally, in a hole dug in the ground covered with maguey leaves, although the interpretation is loose, and in the present day (and in some cases) may refer to meat steamed until tender. This meat is known for its high fat content and strong flavor, often accompanied with onions and cilantro."
    Taco.create! name: "Fish", photo: "http://www.mrsdash.com/sites/default/files/styles/recipe-main-img/public/Fish-Taco's_0.jpg?itok=YLd4BjA_", price: 3, description: "It's fish. On a taco"

    visit root_path
    within("#taco-#{pastor.id}") do
      click_link "Add To Cart"
    end
    visit root_path
    within("#taco-#{barbacoa.id}") do
      click_link "Add To Cart"
    end

    within("#taco-#{pastor.id}") do
      click_link "Remove"
    end

    within("#taco-#{barbacoa.id}") do
      assert_content page, barbacoa.name
    end
    refute_content page, pastor.name


  end

  test "Can add to cart" do
    pastor = Taco.create! name: "Tacos al Pastor", photo: "http://cdn.funcheap.com/wp-content/uploads/2013/04/Tacos-al-Pastor1.jpg", price: 5, description: "Al pastor (from Spanish, lit. In the style of the shepherd) is a dish developed in Central Mexico, likely as a result of the adoption of the shawarma spit-grilled meat brought by Lebanese immigrants to Mexico.[1] Being derived from shawarma, it is also similar to the Turkish doner kebab and the Greek gyros. Whereas shawarma is usually lamb-based (thus the \"shepherd style\" name), gyros and tacos al pastor in Mexico are made from pork."
    Taco.create! name: "Barbacoa", photo: "http://www.seriouseats.com/images/2012/04/20120423-barbacoa-tacos-primary.jpg", price: 3, description: "Barbacoa (About this sound barba'koa (help·info)) is a form of cooking meat that originated in the Caribbean with the Taíno people, from which the term “barbecue” derives.[1] In contemporary Mexico, it generally refers to meats or whole sheep slow-cooked over an open fire, or more traditionally, in a hole dug in the ground covered with maguey leaves, although the interpretation is loose, and in the present day (and in some cases) may refer to meat steamed until tender. This meat is known for its high fat content and strong flavor, often accompanied with onions and cilantro."
    Taco.create! name: "Fish", photo: "http://www.mrsdash.com/sites/default/files/styles/recipe-main-img/public/Fish-Taco's_0.jpg?itok=YLd4BjA_", price: 3, description: "It's fish. On a taco"

    visit root_path
    within("#taco-#{pastor.id}") do
      click_link "Add To Cart"
    end

    assert_content page, "Your Taco Cart"
    assert_content page, pastor.name

  end

  test "can add twice and get two quantity" do

    pastor = Taco.create! name: "Tacos al Pastor", photo: "http://cdn.funcheap.com/wp-content/uploads/2013/04/Tacos-al-Pastor1.jpg", price: 5, description: "Al pastor (from Spanish, lit. In the style of the shepherd) is a dish developed in Central Mexico, likely as a result of the adoption of the shawarma spit-grilled meat brought by Lebanese immigrants to Mexico.[1] Being derived from shawarma, it is also similar to the Turkish doner kebab and the Greek gyros. Whereas shawarma is usually lamb-based (thus the \"shepherd style\" name), gyros and tacos al pastor in Mexico are made from pork."
    Taco.create! name: "Barbacoa", photo: "http://www.seriouseats.com/images/2012/04/20120423-barbacoa-tacos-primary.jpg", price: 3, description: "Barbacoa (About this sound barba'koa (help·info)) is a form of cooking meat that originated in the Caribbean with the Taíno people, from which the term “barbecue” derives.[1] In contemporary Mexico, it generally refers to meats or whole sheep slow-cooked over an open fire, or more traditionally, in a hole dug in the ground covered with maguey leaves, although the interpretation is loose, and in the present day (and in some cases) may refer to meat steamed until tender. This meat is known for its high fat content and strong flavor, often accompanied with onions and cilantro."
    Taco.create! name: "Fish", photo: "http://www.mrsdash.com/sites/default/files/styles/recipe-main-img/public/Fish-Taco's_0.jpg?itok=YLd4BjA_", price: 3, description: "It's fish. On a taco"

    2.times do
      visit root_path
      within("#taco-#{pastor.id}") do
        click_link "Add To Cart"
      end
    end

    within("#taco-#{pastor.id} .quantity") do
      assert_content page, 2
    end



  end
end
