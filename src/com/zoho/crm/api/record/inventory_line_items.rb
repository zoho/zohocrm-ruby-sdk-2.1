require_relative '../record/record'
require_relative '../util/model'

module Record
  class InventoryLineItems < Record
    include Util::Model

    # Creates an instance of InventoryLineItems
    def initialize
      super
    end

      # The method to get the product_name
      # @return An instance of LineItemProduct

    def product_name
      get_key_value('Product_Name')
    end

      # The method to set the value to product_name
      # @param product_name [LineItemProduct] An instance of LineItemProduct

    def product_name=(product_name)
      if product_name!=nil and !product_name.is_a? LineItemProduct
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: product_name EXPECTED TYPE: LineItemProduct', nil, nil)
      end
      add_key_value('Product_Name', product_name)
    end

      # The method to get the parent_id
      # @return An instance of Record

    def parent_id
      get_key_value('parent_id')
    end

      # The method to set the value to parent_id
      # @param parent_id [Record] An instance of Record

    def parent_id=(parent_id)
      if parent_id!=nil and !parent_id.is_a? Record
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: parent_id EXPECTED TYPE: Record', nil, nil)
      end
      add_key_value('parent_id', parent_id)
    end

      # The method to get the quantity
      # @return An instance of Float

    def quantity
      get_key_value('Quantity')
    end

      # The method to set the value to quantity
      # @param quantity [Float] An instance of Float

    def quantity=(quantity)
      if quantity!=nil and !quantity.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: quantity EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('Quantity', quantity)
    end

      # The method to get the discount
      # @return A String value

    def discount
      get_key_value('Discount')
    end

      # The method to set the value to discount
      # @param discount [String] A String

    def discount=(discount)
      if discount!=nil and !discount.is_a? String
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: discount EXPECTED TYPE: String', nil, nil)
      end
      add_key_value('Discount', discount)
    end

      # The method to get the total_after_discount
      # @return An instance of Float

    def total_after_discount
      get_key_value('Total_After_Discount')
    end

      # The method to set the value to total_after_discount
      # @param total_after_discount [Float] An instance of Float

    def total_after_discount=(total_after_discount)
      if total_after_discount!=nil and !total_after_discount.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: total_after_discount EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('Total_After_Discount', total_after_discount)
    end

      # The method to get the net_total
      # @return An instance of Float

    def net_total
      get_key_value('Net_Total')
    end

      # The method to set the value to net_total
      # @param net_total [Float] An instance of Float

    def net_total=(net_total)
      if net_total!=nil and !net_total.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: net_total EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('Net_Total', net_total)
    end

      # The method to get the price_book_name
      # @return An instance of Float

    def price_book_name
      get_key_value('Price_Book_Name')
    end

      # The method to set the value to price_book_name
      # @param price_book_name [Float] An instance of Float

    def price_book_name=(price_book_name)
      if price_book_name!=nil and !price_book_name.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: price_book_name EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('Price_Book_Name', price_book_name)
    end

      # The method to get the tax
      # @return An instance of Float

    def tax
      get_key_value('Tax')
    end

      # The method to set the value to tax
      # @param tax [Float] An instance of Float

    def tax=(tax)
      if tax!=nil and !tax.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: tax EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('Tax', tax)
    end

      # The method to get the list_price
      # @return An instance of Float

    def list_price
      get_key_value('List_Price')
    end

      # The method to set the value to list_price
      # @param list_price [Float] An instance of Float

    def list_price=(list_price)
      if list_price!=nil and !list_price.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: list_price EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('List_Price', list_price)
    end

      # The method to get the unit_price
      # @return An instance of Float

    def unit_price
      get_key_value('unit_price')
    end

      # The method to set the value to unit_price
      # @param unit_price [Float] An instance of Float

    def unit_price=(unit_price)
      if unit_price!=nil and !unit_price.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: unit_price EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('unit_price', unit_price)
    end

      # The method to get the quantity_in_stock
      # @return An instance of Float

    def quantity_in_stock
      get_key_value('quantity_in_stock')
    end

      # The method to set the value to quantity_in_stock
      # @param quantity_in_stock [Float] An instance of Float

    def quantity_in_stock=(quantity_in_stock)
      if quantity_in_stock!=nil and !quantity_in_stock.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: quantity_in_stock EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('quantity_in_stock', quantity_in_stock)
    end

      # The method to get the total
      # @return An instance of Float

    def total
      get_key_value('Total')
    end

      # The method to set the value to total
      # @param total [Float] An instance of Float

    def total=(total)
      if total!=nil and !total.is_a? Float
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: total EXPECTED TYPE: Float', nil, nil)
      end
      add_key_value('Total', total)
    end

      # The method to get the description
      # @return A String value

    def description
      get_key_value('Description')
    end

      # The method to set the value to description
      # @param description [String] A String

    def description=(description)
      if description!=nil and !description.is_a? String
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: description EXPECTED TYPE: String', nil, nil)
      end
      add_key_value('Description', description)
    end

      # The method to get the line_tax
      # @return An instance of Array

    def line_tax
      get_key_value('Line_Tax')
    end

      # The method to set the value to line_tax
      # @param line_tax [Array] An instance of Array

    def line_tax=(line_tax)
      if line_tax!=nil and !line_tax.is_a? Array
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: line_tax EXPECTED TYPE: Array', nil, nil)
      end
      add_key_value('Line_Tax', line_tax)
    end

  end
end
