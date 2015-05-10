class InvoiceSearch
   attr_reader :date_from, :date_to   #setters and getter 
    
   #constructor
    def initialize(params)
       params ||= {}
       @date_from = parsed_date(params [:date_from], 15.days.ago.to_s)
       @date_to = parsed_date(params [:date_to], Date.today.to_s)

    end
    def scope
       #Invoice.where('date BETWEEN ? AND ?', @date_from, @date_to)
       Invoice.find(:all, :conditions => ['date >= ? and date <= ?', params[:date_from], params[:date_to]])
    end
    
    private
    
    def parsed_date(date_string, default)
        Date.parse(date_string)
    rescue ArgumentError, TypeError
            default
        
    end
end