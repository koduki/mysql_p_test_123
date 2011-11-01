def gen_sql name, bulk_size, insert_size, values
    (1..insert_size).map { |x|
        "insert into #{name} values " + (1..bulk_size).map{|y| "(" + values.call(x, y) + ")" }.join(",")
    }.join(";\n") + ";"
end

def save name, sql
    open("#{name}.sql", "w"){|f| f.write sql}
end


@index=0
sql = gen_sql "authors", 1000, 1000, lambda{|x, y| "#{@index+=1}, 'Author#{x.to_s + y.to_s}'"}
save "authors", sql

@index=0
sql = gen_sql "categories", 1000, 1000, lambda{|x, y| "#{@index+=1}, 'Categories#{x.to_s + y.to_s}'"}
save "categories", sql

@index=0
@fk=0
sql = gen_sql "books", 1000, 1000, lambda{|x, y| "#{@index+=1}, 'Title#{x.to_s + y.to_s}', #{@fk+=1}, #{@fk}, 'AAAAAAAAAAAAA'"}
@fk=0
sql+= gen_sql "books", 1000, 1000, lambda{|x, y| "#{@index+=1}, 'Title#{@index}', #{@fk+=1}, #{@fk}, 'AAAAAAAAAAAAA'"}
@fk=0
sql += gen_sql "books", 1000, 1000, lambda{|x, y| "#{@index+=1}, 'Title#{x.to_s + y.to_s}', #{@fk+=1}, #{@fk}, 'AAAAAAAAAAAAA'"}
save "books", sql
