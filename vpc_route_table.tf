# パブリックのルートテーブル作成
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "public_route_table"
  }
}

# パブリックのルートテーブルにパブリックサブネットを割り当て
resource "aws_route_table_association" "public_0" {
  subnet_id      = aws_subnet.public_0.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

# プライベートのルートテーブル作成
resource "aws_route_table" "private_0" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "private_0_route_table"
  }
}
resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "private_1_route_table"
  }
}

# プライベートのルートテーブルにプライベートサブネット割り当て
resource "aws_route_table_association" "private_0" {
  subnet_id      = aws_subnet.private_0.id
  route_table_id = aws_route_table.private_0.id
}
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

