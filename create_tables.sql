CREATE TABLE warehouses (
    warehouse_id SERIAL PRIMARY KEY,
    capacity INT NOT NULL CHECK (capacity > 0),
    address TEXT NOT NULL,
    manager VARCHAR(100) NOT NULL
);

CREATE TABLE placement (
    placement_id SERIAL PRIMARY KEY,
    warehouse_id INT NOT NULL,
    product_code INT NOT NULL,
    packages_count INT NOT NULL CHECK (packages_count > 0),
    shipment_date DATE NOT NULL,
    weight NUMERIC(10, 2) NOT NULL CHECK (weight > 0),
    is_received BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_warehouse
        FOREIGN KEY (warehouse_id)
        REFERENCES warehouses (warehouse_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
