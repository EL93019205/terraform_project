# public_0のNATゲートウェイを作成
resource "aws_nat_gateway" "nat_gateway_0" {
  allocation_id = aws_eip.nat_gateway_0.id
  subnet_id     = aws_subnet.public_0.id
  depends_on    = [aws_internet_gateway.example]
  tags = {
    Name = "public_0_subnet_nat_gateway_0"
  }
}
resource "aws_eip" "nat_gateway_0" {
  vpc        = true
  depends_on = [aws_internet_gateway.example]
  tags = {
    Name = "eip0"
  }
}

# public_1のNATゲートウェイを作成
resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.nat_gateway_1.id
  subnet_id     = aws_subnet.public_1.id
  depends_on    = [aws_internet_gateway.example]
  tags = {
    Name = "public_1_subnet_nat_gateway_1"
  }
}
resource "aws_eip" "nat_gateway_1" {
  vpc        = true
  depends_on = [aws_internet_gateway.example]
  tags = {
    Name = "eip1"
  }
}


