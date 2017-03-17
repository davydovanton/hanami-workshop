Hanami::Model.migration do
  change do
    add_column :links, :clicks, Integer, default: 0

    alter_table :links do
      add_foreign_key :account_id, :accounts, on_delete: :cascade
    end
  end
end
