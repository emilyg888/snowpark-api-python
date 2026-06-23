import json
from pathlib import Path

path = Path("data/car_sales.jsonl")

with path.open() as f:
    first = json.loads(next(f))

def show_shape(value, indent=0):
    prefix = "  " * indent

    if isinstance(value, dict):
        for key, child in value.items():
            print(f"{prefix}{key}: {type(child).__name__}")
            show_shape(child, indent + 1)

    elif isinstance(value, list):
        print(f"{prefix}[list length {len(value)}]")
        if value:
            show_shape(value[0], indent + 1)

show_shape(first)

/* Output:
date: str
dealership: str
salesperson: dict
  id: str
  name: str
customer: list
  [list length 1]
    name: str
    phone: str
    address: str
vehicle: list
  [list length 1]
    make: str
    model: str
    year: int
    price: int
    extras: list
      [list length 2]
*/