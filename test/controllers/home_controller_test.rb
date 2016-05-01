require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "unknown calculator method" do
    a = 140
    b = 360
    operation = 'unknown'
    get(:index, {:a => a, :b => b, :operation => operation})
    assert_response :success
    assert_equal(@request.params[:a], a.to_s, "First operand")
    assert_equal(@request.params[:b], b.to_s, "Second operand")
    assert_equal(@request.params[:operation], operation, "Operation type")
    assert_equal(assigns(:result) , nil, "Nil result")
  end

  test "calculator sum" do
    a = 72.9
    b = 190.1
    operation = 'sum'
    get(:index, {:a => a, :b => b, :operation => operation})
    assert_response :success
    assert_equal(@request.params[:a], a.to_s, "First operand")
    assert_equal(@request.params[:b], b.to_s, "Second operand")
    assert_equal(@request.params[:operation], operation, "Operation type")
    assert_equal(assigns(:result) , a.to_s + ' + ' + b.to_s + ' = ' + (a + b).to_i.to_s, "Sum result")
  end

  test "calculator subtr" do
    a = 60.51
    b = 10.17
    operation = 'subtr'
    get(:index, {:a => a, :b => b, :operation => operation})
    assert_response :success
    assert_equal(@request.params[:a], a.to_s, "First operand")
    assert_equal(@request.params[:b], b.to_s, "Second operand")
    assert_equal(@request.params[:operation], operation, "Operation type")
    assert_equal(assigns(:result) , a.to_s + ' - ' + b.to_s + ' = ' + (a - b).to_s, "Subtr result")
  end

  test "calculator div infinity" do
    a = 78
    b = 0
    operation = 'div'
    get(:index, {:a => a, :b => b, :operation => operation})
    assert_response :success
    assert_equal(@request.params[:a], a.to_s, "First operand")
    assert_equal(@request.params[:b], b.to_s, "Second operand")
    assert_equal(@request.params[:operation], operation, "Operation type")
    assert_equal(assigns(:result) , a.to_s + ' / ' + b.to_s + ' = ' + "Infinity", "Div result infinity")
  end

  test "calculator sqrt" do
    a = 144
    operation = 'sqrt'
    get(:index, {:a => a, :operation => operation})
    assert_response :success
    assert_equal(@request.params[:a], a.to_s, "First operand")
    assert_equal(@request.params[:operation], operation, "Operation type")
    assert_equal(assigns(:result) , 'sqrt(' + a.to_s + ') = ' + Math.sqrt(a).to_i.to_s, "Sqrt result")
  end

end
