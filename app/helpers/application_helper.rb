module ApplicationHelper
    #returns full title on per-page basis.
    def full_title(page_title)
       base_title ="Ruby in Rails App Using Rspec Testing  "
       if page_title.empty?
            base_title
       else
            '#{base_title} | #{page_title}'
       end
    end
 
   #string shuffle function
    def string_shuffle(s)
       s.split('').shuffle.join
    end
   
   
  
end
