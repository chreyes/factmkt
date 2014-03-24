# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140324202348) do

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.text     "direccion"
    t.string   "ciudad"
    t.text     "giro"
    t.string   "rut"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facturas", force: true do |t|
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.integer  "numero"
    t.string   "oc"
    t.string   "gd"
    t.string   "cp"
    t.date     "vencimiento"
  end

  create_table "items", force: true do |t|
    t.integer  "cantidad"
    t.text     "detalle"
    t.integer  "precio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "factura_id"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
