Hanami::Model.migration do
  change do
    create_table :accounts do
      primary_key :id

      column :login, String
      column :admin, TrueClass, default: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
