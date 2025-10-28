owner = Owner.find_or_create_by!(name: "João da Silva", email: "joao@example.com", phone: "11999999999")
Property.find_or_create_by!(title: "Apto Centro", address: "Rua X", city: "Araras", state: "SP", zip: "13600-000",
                            price_cents: 450_000_00, status: :available, owner: owner)
