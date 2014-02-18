require 'test_helper'

class ProductTest < ActiveSupport::TestCase
fixtures :products
def new_product(image_url)
test "product is not valid without a unique title - il8n" do
  product = Product.new(title:	products(:ruby).title,
			  description:	"yyy",
			  price:		1,
			  image_url:	"fred.gif")
	end
assert product.invalid?
assert_equal [Il8n.translate('errors.messages.taken')],
				product.errors[:title]
end

test "image url" do
	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
			 http://a.b.c/x/y/z/fred.gif }
	bad = %w{ fred.doc fred.gif/more fretd.gif.more }
	ok.each do |name|
		assert new_product(name).valid?, "#{name} should be valid"
		end
		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldn't be valid"
			end
		end

end		
