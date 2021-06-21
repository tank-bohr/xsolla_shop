CONTROLLER=lib/xsolla_shop_web/controllers/product_controller.ex

.PHONY: server
server:
	iex -S mix phx.server

.PHONY: sql
sql:
	docker-compose run --rm db psql -h db -U postgres -d xsolla_shop_dev

.PHONY: bootstrap
bootstrap: $(CONTROLLER)

$(CONTROLLER):
	mix phx.gen.json \
		Products Product products \
		sku:string:unique \
		name:string \
		type:string \
		cost:integer
