

// Acme Telco User Workflow Synthetics script

// environment helper
var env_config = {
    website_url: "http://webportal.telco.nrdemo.com"
  }

  // script helpers
  var By = $driver.By;
  var assert = require('assert');


  //------------------------------
  // Customize workflow by reordering or removing functions below
  //------------------------------

  //loads home page - must be present (and first) for other workflow functions to work
  loadHomePage();

  //display "Login" page
  clickLogin();

  //supply credentials and login (uses back-end service)
  login();

  //display Products/Services dropdown

  //add one phone to the shopping cart
  addFirstPhoneToCart();

  //add one plan to the shopping cart
  addFirstPlanToCart();

  //add multiple phones to cart by adjusting quanity = "[here]" below
  var quantity = "6"
  addMultiplePhonesToCart();

  //add multiple plans to cart by adjusting quanity = "[here]" below
  var quantity = "6"
  addMultiplePlansToCart();

  //checkout process - zero's out cart
  buyNow();

  //------------------------------
  // Helper functions
  //------------------------------

  // Shopping helpers
   function clearItemQuantity() {
    return $browser.findElement(By.className("item_Quantity")).clear().then(function(){
      console.log("Item Quantity Cleared")
    });
  }

  function addToCart() {
    return $browser.findElement(By.className("item_add")).click().then(function() {
      console.log("Added to Cart")
    });
  }

  function emptyCart() {
    return $browser.findElement(By.linkText("Acme Telco Home")).click().then(function() {
      console.log("Cart empty")
    });
  }

  //------------------------------
  // Workflow functions referenced above
  //------------------------------

  function loadHomePage() {
    return $browser.get(env_config['website_url']).then(function() {
      return $browser.findElement($driver.By.css('h1')).then(function(element){
        return element.getText().then(function(text)
        {
        console.log(text)
        assert.ok(text.indexOf('Welcome to Acme Telco') !== -1, 'Page H1 title did not match');
        });
      });
    });
  }

  function clickLogin() {
     return $browser.waitForAndFindElement(By.linkText("Login")).then(function(element){
       element.click().then(function() {
         console.log("Visited the login page")
       });
     });
  }

  function login() {
    var username = "syntheticuser@acme.com"
    var password = "12345"
    return $browser.findElement(By.name("username")).sendKeys(username).then(function(){
      return $browser.findElement(By.name("password")).sendKeys(password).then(function(){
        return $browser.findElement(By.className("btn")).click().then(function() {
          console.log("Logged in")
        });
      });
    });
  }

  function addFirstPhoneToCart() {
      return $browser.findElement(By.linkText("Products/Services")).click().then(function() {
        return $browser.findElement(By.linkText("Phones")).click().then(function() {
          return $browser.findElements(By.css("a.btn.btn-default.item_browse")).then(function(phones) {
            var phone = phones[0];
            phone.click().then(function() {
              return $browser.findElement(By.className("item_add")).click().then(function() {
               console.log("Added phone to cart")
              });
            });
          });
        });
      });
  }

  function addMultiplePhonesToCart() {
       $browser.findElement(By.linkText("Products/Services")).click().then(function() {
          return $browser.findElement(By.linkText("Phones")).click().then(function() {
            return $browser.findElements(By.css("a.btn.btn-default.item_browse")).then(function(phones) {
              var phone = phones[1];
              phone.click().then(function() {
                clearItemQuantity();
                 return $browser.findElement(By.className("item_Quantity")).sendKeys(quantity).then(function(){
                  addToCart();
                  console.log("Added " + quantity + " phones to cart")
                  });
              });
            });
          });
      });
  }

  function addFirstPlanToCart() {
      return $browser.findElement(By.linkText("Products/Services")).click().then(function() {
        return $browser.findElement(By.linkText("Plans")).click().then(function() {
          return $browser.findElements(By.css("a.btn.btn-default.item_browse")).then(function(plans) {
            var plan = plans[0];
             plan.click().then(function() {
              return $browser.findElement(By.className("item_add")).click().then(function() {
               console.log("Added plan to cart")
              });
            });
          });
        });
      });
  }

  function addMultiplePlansToCart() {
       $browser.findElement(By.linkText("Products/Services")).click().then(function() {
          return $browser.findElement(By.linkText("Plans")).click().then(function() {
            return $browser.findElements(By.css("a.btn.btn-default.item_browse")).then(function(plans) {
              var plan = plans[0];
                plan.click().then(function() {
                clearItemQuantity();
                 return $browser.findElement(By.className("item_Quantity")).sendKeys(quantity).then(function(){
                  addToCart();
                  console.log("Added " + quantity + " plans to cart")
                  });
              });
            });
          });
      });
  }

  function buyNow() {
    return $browser.findElement(By.id("shoppingcart")).click().then(function() {
      $browser.waitForAndFindElement(By.className("simpleCart_checkout"), 10000).then(function() {
        return $browser.findElement(By.className("simpleCart_checkout")).click().then(function() {
          console.log("Purchased cart contents")
          return $browser.sleep(2000).then(function() {
            emptyCart();
          });
        });
      }, function (err) {
        $browser.takeScreenshot();
        assert.ok(false,"Unable to locate checkout button");
      });
    });
  }
