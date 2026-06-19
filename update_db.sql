ALTER TABLE orders ADD COLUMN signatureStatus VARCHAR(50) DEFAULT 'Chưa ký xác nhận';
ALTER TABLE orders ADD COLUMN digitalSignature TEXT;
ALTER TABLE orders ADD COLUMN publicKeyUsed TEXT;
ALTER TABLE orders ADD COLUMN signatureDeadline DATETIME;
