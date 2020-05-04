require "roda"

class App < Roda
  route do |r|
    # GET / request
    r.root do
      r.redirect "/hello"
    end

    # /hello branch
    r.on "hello" do
      # Set variable for all routes in /hello branch
      @greeting = '<meta charset="UTF-8">Здравствуйте'

      # GET /hello/world request
      r.get "world" do
        "#{@greeting} world!"
      end

      # /hello request
      r.is do
        # GET /hello request
        r.get do
          "#{@greeting}!"
        end

        # POST /hello request
        r.post do
          puts "Someone said #{@greeting}!"
          r.redirect
        end
      end
    end




    r.on "a" do           # /a branch
      r.on "b" do         # /a/b branch
        r.is "c" do       # /a/b/c request
          r.get do
            "Request from a/b/c"
          end    # GET  /a/b/c request
          r.post do end   # POST /a/b/c request
        end
        r.get "d" do
          "Request from 'd'"
        end  # GET  /a/b/d request
        r.post "e" do end # POST /a/b/e request
      end
    end

    r.on "get" do
      r.get "rnd" do 
          rand(100..5000).to_s
       end
       r.on "sophisticated/rng" do
          if(r.params["min"] == nil)
              return "Min not found"
          end

          if(r.params["max"] == nil)
              return "Max not found"
          end
       
          begin
              num1 = r.params["min"].to_f
              num2 = r.params["max"].to_f
              #return num1.to_s + num2.to_s
              return (rand * (num2-num1) +  num1).to_s
          rescue
              return "WTF"
          end
          
      end
  end

    # GET /post/2011/02/16/hello
    r.get "post", Integer, Integer, Integer, String do |year, month, day, slug|
      "#{year}-#{month}-#{day} #{slug}" #=> "2011-02-16 hello"
    end

    # GET /cool/hello/NAME/SURNAME
    r.get "cool","hello", String, String do |name, surname|
         '<meta charset="UTF-8">Здравствуйте' " #{name} #{surname}!"
    end

    #GET /calc/min/NUM_ONE/NUM_TWO
    r.get "calc","min", Integer, Integer do |num_one,num_two|
        if num_one.to_i<num_two.to_i then "min: #{num_one}" 
        else  "min: #{num_two}" 
        end
    end

    #GET /calc/multiply/NUM_ONE/NUM_TWO
    r.get "calc","multiply", String, String do |num_one,num_two|
       
        "result = #{num_one.to_f * num_two.to_f}"
    end

  

    # /search?q=barbaz
    r.get "search" do
      "Searched for #{r.params['q']}" #=> "Searched for barbaz"
    end
  end
end