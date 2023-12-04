package org.example;

import java.sql.*;

public class Libreria {
    public static void main(String[] args) {
        try {
            Connection connection = DriverManager
                    .getConnection("jdbc:sqlite:Empresa.db");

            String sql = "select Nom, Cognoms from Empleats where Nom LIKE ?";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,"Jaime");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                String nom = resultSet.getString("Nom");
                String cognom = resultSet.getString("Cognoms");

                System.out.println(nom+" "+cognom);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
