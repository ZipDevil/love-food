require 'rails_helper'

RSpec.describe "ClientsControllers", type: :request do
  describe "get clients_path" do
    it "renders the index view" do
      FactoryBot.create_list(:client, 10)
      get clients_path
      expect(response.status).to eq(200)
    end
  end
  describe "get client_path" do
    it "renders the :show template" do
      client = FactoryBot.create(:client)
      get client_path(id: client.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the client id is invalid" do
      get client_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to clients_path
    end
  end
  describe "get new_client_path" do
    it "renders the :new template" do
      #client = FactoryBot.create(:client)
      #get client_path(id: client.id)
      #expect(response).to render_template(:new)
      get new_client_path
      expect(response.status).to eq(200)
    end
  end
  describe "get edit_client_path" do
    it "renders the :edit template" do
      client = FactoryBot.create(:client)
      get edit_client_path(id: client.id)
      #expect(response).to render_template(:edit)
      expect(response.status).to eq(200)
    end
  end
  describe "post clients_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      client_attributes = FactoryBot.attributes_for(:client)
      expect { post clients_path, params:{client: client_attributes}
    }.to change(Client, :count)
      expect(response).to redirect_to client_path(id: Client.last.id)
    end
  end
  describe "post clients_path with invalid data" do
    it "does not save a new entry or redirect" do
      client_attributes = FactoryBot.attributes_for(:client)
      client_attributes.delete(:first_name)
      expect { post clients_path, params:{client: client_attributes}
    }.to_not change(Client, :count)
      expect(response.status).to eq(200)
    end
  end
  describe "put client_path with valid data" do
    it "updates an entry and redirects to the show path for the client" do
      client = FactoryBot.create(:client)
      patch client_path(client), params: {client: { first_name: "Jay"}}
      client.reload
      expect(client.first_name).to eq("Jay")
      expect(response).to redirect_to client_path(id: client.id)
    end
  end
  describe "put client_path with invalid data" do
    it "does not update the client record or redirect" do
      #we want to test updating a client record, so first we have to create the record
      client = FactoryBot.create(:client)
      #put is the operation for update.  The route for update includes
      #the client.id.  We attempt to update the client record with
      #a phone number of "123" which is invalid
      put client_path(id: client.id), params: {client: { phone: "123"}}
      #we have to reload the client object to see if what is in the database
      #has changed
      client.reload
      #we expect it not to change because the phone number is invalid
      expect(client.phone).to_not eq("123")
      #we don't expect a redirect, and therefore the HTTP status should be 200
      expect(response.status).to eq(200)
    end
  end
end
