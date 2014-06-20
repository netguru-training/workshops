require 'spec_helper'

describe CategoriesController do

  let(:valid_attributes) { { name: "MyString" } }

  let(:valid_session) { {} }

  let(:user) { build(:user) }

  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

  context 'user is not an admin' do
    before do
      controller.current_user.stub(admin?: false)
    end

    describe "GET new" do
      it "redirects user to the login page" do
        get :new, {}, valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET edit" do
      it "redirects user to the login page" do
        category = Category.create! valid_attributes
        get :edit, { id: category.to_param }, valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST create" do
      it 'redirects user to the login page' do
        post :create, {category: valid_attributes}, valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT update" do
      it "redirect user to the login page" do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => { "name" => "MyString" }}, valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'user is an admin' do
    before do
      controller.current_user.stub(admin?: true)
    end

    describe "GET index" do
      it "exposes all categories" do
        category = Category.create! valid_attributes
        get :index, {}, valid_session
        expect(controller.categories).to eq([category])
      end
    end

    describe "GET show" do
      it "exposes the requested category" do
        category = Category.create! valid_attributes
        get :show, { id: category.to_param }, valid_session
        expect(controller.category).to eq(category)
      end
    end

    describe "GET new" do
      it "exposes a new category" do
        get :new, {}, valid_session
        expect(controller.category).to be_a_new(Category)
      end
    end

    describe "GET edit" do
      it "exposes the requested category" do
        category = Category.create! valid_attributes
        get :edit, { id: category.to_param }, valid_session
        expect(controller.category).to eq(category)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Category" do
          expect {
            post :create, {category: valid_attributes}, valid_session
          }.to change(Category, :count).by(1)
        end

        it "exposes a newly created category as #category" do
          post :create, {category: valid_attributes}, valid_session
          expect(controller.category).to be_a(Category)
          expect(controller.category).to be_persisted
        end

        it "redirects to the created category" do
          post :create, {category: valid_attributes}, valid_session
          expect(response).to redirect_to(Category.last)
        end
      end

      describe "with invalid params" do
        it "exposes a newly created but unsaved category" do
          Category.any_instance.stub(:save).and_return(false)
          post :create, {category: { "name" => "invalid value" }}, valid_session
          expect(controller.category).to be_a_new(Category)
        end

        it "re-renders the 'new' template" do
          Category.any_instance.stub(:save).and_return(false)
          post :create, {category: { "name" => "invalid value" }}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      let(:category) { Category.create! valid_attributes }
      describe "with valid params" do
        it "updates the requested category" do
          Category.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => category.to_param, :category => { "name" => "MyString" }}, valid_session
        end

        it "exposes the requested category" do
          put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
          expect(controller.category).to eq(category)
        end

        it "redirects to the category" do
          put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
          response.should redirect_to(category)
        end
      end

      describe "with invalid params" do
        it "exposes the category" do
          Category.any_instance.stub(:save).and_return(false)
          put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}, valid_session
          expect(controller.category).to eq(category)
        end

        it "re-renders the 'edit' template" do
          Category.any_instance.stub(:save).and_return(false)
          put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      let!(:category) { Category.create! valid_attributes }

      it "destroys the requested category" do
        expect {
          delete :destroy, {:id => category.to_param}, valid_session
        }.to change(Category, :count).by(-1)
      end

      it "redirects to the categories list" do
        delete :destroy, {:id => category.to_param}, valid_session
        response.should redirect_to(categories_url)
      end
    end
  end

end
