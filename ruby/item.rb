
AGED = 'Aged Brie';
BACKSTAGE = 'Backstage passes to a TAFKAL80ETC concert';
SULFURAS = 'Sulfuras, Hand of Ragnaros';

class Item
    attr_accessor :name, :sell_in, :quality
  
    def initialize(name, sell_in, quality)
      @name = name
      @sell_in = sell_in
      @quality = quality
    end
  
    def to_s
      "#{@name}, #{@sell_in}, #{@quality}"
    end
  
    def modify_quality(value)
      if value.eql? 0
        @quality = 0
      end
      @quality += value
    end
  
    def modify_sell_in(value)
      if value.eql? 0 
        @sell_in = 0
      end
      @sell_in += value
    end

    def check_less(parameter, value)
        if parameter < value
          true
        end
        false
    end
    
    def check_more(parameter, value)
        if parameter > value
            true
        end
        false
    end
    
    def update_quality_item
        if @name != AGED and @name != BACKSTAGE
            if @quality > 0
                if @name != SULFURAS
                    modify_quality(-1)
                end
            end
        else
            if check_less(@quality, 50)
                modify_quality(1)
                if @name.eql? BACKSTAGE
                    if check_less(@sell_in, 11) 
                        if check_less(@quality, 50)
                            modify_quality(1)
                        end
                    end
                    if check_less(@sell_in, 6)
                        if check_less(@quality, 50)
                            modify_quality(1)
                        end
                    end
                end
            end
        end
        if @name != SULFURAS
          modify_sell_in(-1)
        end
        if check_less(@sell_in, 0)
            if @name != AGED
                if @name != BACKSTAGE
                    if @quality > 0
                        if @name != SULFURAS
                            modify_quality(-1)
                        end
                    end
                else
                    modify_quality(0)
                end
            else
                if check_less(@quality, 50)
                    modify_quality(1)
                end
            end
        end
    end 
end
  
Item1 = Item.new("Item1", 10, 20)
puts "Hello World!"
  