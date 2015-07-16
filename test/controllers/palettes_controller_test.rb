require 'test_helper'

class PalettesControllerTest < ActionController::TestCase
  def setup
    @palette = palettes(:one)
  end

  # index
  test 'GET #index as JSON' do
    get :index, format: :json
    assert_response :success
    response_item = JSON.parse(response.body)[0]
    assert_equal @palette.name, response_item['name']
    assert_equal @palette.dom_one, response_item['dom_one']
    assert_equal @palette.dom_two, response_item['dom_two']
    assert_equal @palette.sec_one, response_item['sec_one']
    assert_equal @palette.sec_two, response_item['sec_two']
    assert_equal @palette.pop, response_item['pop']
  end

  # show
  test "GET #show displays correct palette" do
    get :show, id: @palette.id, format: :json
    assert_response :success
    response_item = JSON.parse(response.body)
    assert_equal @palette.name, response_item['name']
    assert_equal @palette.dom_one, response_item['dom_one']
    assert_equal @palette.dom_two, response_item['dom_two']
    assert_equal @palette.sec_one, response_item['sec_one']
    assert_equal @palette.sec_two, response_item['sec_two']
    assert_equal @palette.pop, response_item['pop'] 
  end

  # create
  test 'POST creates with valid attributes' do 
    assert_difference('Palette.count', 1) do
      post :create, palette: { name: 'test nameA', dom_one: 'test domA', dom_two: 'test dom2', sec_one: 'test sec1', sec_two: 'test sec2', pop: 'test pop' }, format: :json
      assert_response 201
    end
  end

  test 'POST does not creates with invalid attributes' do 
    assert_no_difference('Palette.count') do
      post :create, palette: { name: '', dom_one: '', dom_two: '', sec_one: '', sec_two: '', pop: '' }, format: :json
      assert_response 422
      response_item = JSON.parse(response.body)
      refute 'test name' == response_item['name']
      refute 'dom_one' == response_item['test dom1']
    end
  end

  # update
  test 'PUT updates with valid attributes' do
    put :update, id: @palette.id, palette: { name: 'test nameB', dom_one: 'test dom1B' }, format: :json
    assert_response 200
    response_item = JSON.parse(response.body)
    assert 'test nameB' == response_item['name']
    assert 'test dom1B' == response_item['dom_one']
  end

  test 'PUT does not update invalid attributes' do
    put :update, id: @palette.id, palette: { name: '', dom_one: '' }, format: :json
    assert_response 422
    response_item = JSON.parse(response.body)
    refute '' == response_item['name']
    refute '' == response_item['dom_one']
  end

  # destroy
  test 'DELETE destroy does in fact destroy' do
    assert_difference('Palette.count', -1) do
      delete :destroy, id: @palette.id, format: :json
    end
  end

end














