package org.example;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.*;
import java.util.Scanner;

public class ScriptLibreria {
    static Connection connection;
    public static void main(String[] args) {
        try {
           StringBuilder cont = new StringBuilder();
           BufferedReader bufferedReader = new BufferedReader(new FileReader("Libreria.sql"));
           String linia;

           while ((linia = bufferedReader.readLine())!=null){
               cont.append(linia).append("\n");
           }
           bufferedReader.close();

            connection = DriverManager
                    .getConnection("jdbc:sqlite:Libreria.db");

            String sql = cont.toString();
            Statement statement=connection.createStatement();
            statement.executeUpdate(sql);

            doSelect();
            doInsert();
            System.out.println("*************************************+********************\n\n" +
                    "Insert\n\n" +
                    "*************************************+********************\n");
            doSelect();
            doUpdate();
            System.out.println("*************************************+********************\n\n" +
                    "Update\n\n" +
                    "*************************************+********************\n");
            doSelect();
            doDelete();
            System.out.println("*************************************+********************\n\n" +
                    "Delete\n\n" +
                    "*************************************+********************\n");
            doSelect();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private static void doDelete() throws SQLException {
        String sql = "delete from libros where titulo like ?";
        PreparedStatement preparedStatement =connection.prepareStatement(sql);
        preparedStatement.setString(1,"Ejemplo1");

        preparedStatement.executeUpdate();
    }

    private static void doUpdate() throws SQLException {
        String sql = "update libros set titulo = ? where titulo like ?";
        PreparedStatement preparedStatement =connection.prepareStatement(sql);
        preparedStatement.setString(1,"Ejemplo1");
        preparedStatement.setString(2,"Ejemplo");

        preparedStatement.executeUpdate();
    }

    private static void doInsert() throws SQLException {
        String sql = "insert into libros (titulo,descripcion,autor,url) values (?,?,?,?)";
        PreparedStatement preparedStatement =connection.prepareStatement(sql);
        preparedStatement.setString(1,"Ejemplo");
        preparedStatement.setString(2, "Ejemplo");
        preparedStatement.setString(3, "Ejemplo");
        preparedStatement.setString(4, "Ejemplo");

        preparedStatement.executeUpdate();
    }

    private static void doSelect() throws SQLException {
        Statement statement = connection.createStatement();
        String sql="Select * from libros";
        ResultSet resultSet = statement.executeQuery(sql);

        System.out.println("**************LIBROS:***************\n");
        while (resultSet.next()){
            System.out.println(
                    "Id: "+resultSet.getInt("id")+"\n"+
                    "Titulo: "+resultSet.getString("titulo")+"\n"+
                    "Descripción: "+resultSet.getString("descripcion")+"\n"+
                    "Autor: "+resultSet.getString("autor")+"\n"+
                    "Url: "+resultSet.getString("url")+"\n\n\n");
        }

        sql="Select * from personajes";
        resultSet = statement.executeQuery(sql);

        System.out.println("*************Personajes:***************\n");
        while (resultSet.next()){
            System.out.println(
                    "Id: "+resultSet.getInt("id")+"\n"+
                    "Nombre: "+resultSet.getString("nombre")+"\n"+
                    "Descripción: "+resultSet.getString("descripcion")+"\n"+
                    "IdLibro: "+resultSet.getString("id_libro")+"\n");
        }
    }
}
