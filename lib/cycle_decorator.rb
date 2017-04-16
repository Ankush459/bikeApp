# the concrete component we would like to decorate, a car in our example
class BasicCycle
    def initialize(c, m, color)
        @cost = c
        @model = m
        @color = color
        @description = "basic cycle"
    end
    
    # getter method
    def cost 
        return @cost
    end
    
    # a method which returns a string representation of the object of type BasicCycle
    def details
        return @description + "; " + @model + "; " + @color + ": " + "#{@cost}"
    end
    
    # getter method
    def color
        return @color
    end
    
    # getter method
    def model 
        return @model
    end
    
end # ends the BasicCycle class



# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class CycleDecorator < BasicCycle
    def initialize(basic_cycle)
        #basic_cycle is a real car, i.e. the component we want to decorate
        @basic_cycle = basic_cycle
        super(@basic_cycle.cost, @basic_cycle.model, @basic_cycle.color)
        @extra_cost = 0
        @description = "no extra feature"
    end
    
    # override the cost method to include the cost of the extra feature	
    def cost        
        return @extra_cost + @basic_cycle.cost
    end
    
    # override the details method to include the description of the extra feature
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_cycle.details
    end
    
end # ends the CarDecorator class


# a concrete decorator --  define an extra feature
class MirrorDecorator < CycleDecorator
    def initialize(basic_cycle)
        super(basic_cycle)
        @extra_cost = 1
        @description = "anti glare rear view mirror"
    end
    
end # ends the MirrorDecorator class


# another concrete decorator -- define an extra feature
class ElectricWindowsDecorator < CycleDecorator
    def initialize(basic_cycle)
        super(basic_cycle)
        @extra_cost = 2
        @description = "electric windows"
    end
    
end # ends the ElectricWindowsDecorator class


# another concrete decorator -- define an extra feature
class ParkingSensorDecorator < CycleDecorator
    def initialize(basic_cycle)
        super(basic_cycle)
        @extra_cost = 3
        @description = "parking sensor"
    end
    
end # ends the ParkingSensorDecorator class

