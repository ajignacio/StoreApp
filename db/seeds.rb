# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create dummy Vat
Vat.create([{name: 'Zero', percent: 0.00},{name: 'Reduced', percent: 5.00}, {name: 'Standard', percent: 20.00}])


# Create dummy Product
_zero = Vat.find_by_name('Zero')
_reduced = Vat.find_by_name('Reduced')
_standard = Vat.find_by_name('Standard')
Product.create([{name: 'Scotland Flag', code: '01', price: 20.00, vat_id: _zero.id},{name: 'Children’s Car Seat', code: '02', price: 33.90, vat_id: _reduced.id},{name: 'Magnetic Wrist Band', code: '03', price: 9.00, vat_id: _standard.id}])
