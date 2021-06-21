# XsollaShop

## Development

### Prerequisite

  * Elixir
  * docker-compose


### Run app in local env

- Run local postgres: `docker-compose up -d db`
- `mix deps.get`
- `make server`

### Usage

Create product:

```bash
curl \
  -H "Content-Type: application/json" \
  -d '{"product": {"sku": "ko-ko", "name": "game", "cost": 10, "type": "toy"}}' \
  http://localhost:4000/api/products
```

List products:

```bash
curl http://localhost:4000/api/products
```
