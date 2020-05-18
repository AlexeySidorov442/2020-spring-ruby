# frozen_string_literal: true

require 'roda'
require_relative 'lib/triangle_list.rb'
require_relative 'lib/triangle.rb'
require_relative 'lib/input_validators.rb'

class App < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end
  opts[:index] = TriangleList.new([
                                    Triangle.new(3, 4, 5),
                                    Triangle.new(5, 12, 13),
                                    Triangle.new(4, 6, 10)
                                  ])

  route do |r|
    r.root do
      'Hello everyone'
    end

    r.on 'triangle' do
      r.is do
        @triangles=opts[:index]
        view('index')
      end

      r.on 'new' do
        r.get do
          view('triangle_new')
        end

        r.post do
          @params = InputValidators.check_side_lengths(r.params['size_a'], r.params['size_b'], r.params['size_c'])
          if @params[:error].empty?
            opts[:index].add_triangle(Triangle.new(@params[:size_a], @params[:size_b], @params[:size_c]))
            r.redirect '/triangle'
          else
            view('triangle_new')
          end
        end
      end
    end
  end
end
