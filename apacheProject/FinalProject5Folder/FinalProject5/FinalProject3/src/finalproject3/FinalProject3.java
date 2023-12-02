/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalproject3;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.time.Clock;
import java.time.ZoneId;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;


/**
 *
 * @author qwang12
 */
public class FinalProject3 extends JFrame{

    /**
     * @param args the command line arguments
     */
   public static void main(String[] args) {
        // TODO code application logic here
                new JTableExamples();

          new ActionEventDemo();
          ArrayList columnNames = new ArrayList();
        ArrayList data = new ArrayList();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
    }catch (ClassNotFoundException e){
        System.out.println(e);
    }
    
    final String ID = "kfergu10";
    final String PW = "COSC*2kc9l";
    final String SERVER = "jdbc:mysql://triton.towson.edu:3360/?serverTimezone=EST#/kfergu10db?useSSL=false";
    String querys;
    
    try {
        Connection con = DriverManager.getConnection(SERVER, ID, PW);
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("SELECT * FROM kfergu10db.Employees");
        PreparedStatement updateStaff = null;
         ResultSetMetaData md = rs.getMetaData();
         int columns = md.getColumnCount();
          for (int i = 1; i <= columns; i++)
            {
                columnNames.add( md.getColumnName(i) );
            }
          
        while (rs.next()){
            ArrayList row = new ArrayList(columns);

                for (int i = 1; i <= columns; i++)
                {
                    row.add( rs.getObject(i) );
                }

                data.add( row );
            String bNo = rs.getString("Emp_SSN_f");
            String street = rs.getString("Mgr_SSN_f");
            String city = rs.getString("Super_ssn_f");
            String postcode = rs.getString("Email_f");
            System.out.println(bNo+", "+street+", "+city+", "+ postcode);
            
        }
        querys = "UPDATE kfergu10db.Employees SET Email_f = 'c@gmail.com' WHERE Emp_SSN_f = '123123123';";
        updateStaff = con.prepareStatement(querys);
        updateStaff.executeUpdate();
    }catch (SQLException e){
        System.err.println(e);
    }
     Vector columnNamesVector = new Vector();
        Vector dataVector = new Vector();
          for (int i = 0; i < data.size(); i++)
        {
            ArrayList subArray = (ArrayList)data.get(i);
            Vector subVector = new Vector();
            for (int j = 0; j < subArray.size(); j++)
            {
                subVector.add(subArray.get(j));
            }
            dataVector.add(subVector);
        }
       JTable table = new JTable(dataVector, columnNamesVector)
        {
            public Class getColumnClass(int column)
            {
                for (int row = 0; row < getRowCount(); row++)
                {
                    Object o = getValueAt(row, column);

                    if (o != null)
                    {
                        return o.getClass();
                    }
                }

                return Object.class;
            }
        };
       
    }//Main
   public static class ActionEventDemo implements ActionListener{
      
           JFrame frame =new JFrame();
           JButton updateButton=new JButton("Update");//Creating object of JButton class
           JButton deleteButton=new JButton("Delete");
           JButton insertButton=new JButton("Insert");
           ActionEventDemo(){
       
         prepareGUI();
               buttonProperties();//Calling buttonProperties() method
           }
          
            public void prepareGUI(){
        frame.setTitle("My Window");
        frame.getContentPane().setLayout(null);
        frame.setVisible(true);
        frame.setBounds(200,200,400,400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
         
    }
             public void buttonProperties(){
        updateButton.setBounds(130,200,100,40);//Setting location and size of button
        frame.add(updateButton);//adding button to the frame
         deleteButton.setBounds(130,270,100,40);//Setting location and size of button
        frame.add(deleteButton);//adding button to the frame
        insertButton.setBounds(130,340,100,40);//Setting location and size of button
        frame.add(insertButton);//adding button to the frame
        updateButton.addActionListener(this);
        deleteButton.addActionListener(this);
        insertButton.addActionListener(this);


    }
         @Override
    public void actionPerformed(ActionEvent e) {
 
    }     
    
   
   }//ActionEventDemo
   
  public static class JTableExamples {
    // frame
    JFrame f;
    // Table
    JTable j;
 
    // Constructor
       JTableExamples()
    {
        // Frame initialization
        f = new JFrame();
 
        // Frame Title
        f.setTitle("JTable Example");
 
        // Data to be displayed in the JTable
        String[][] data = {
            { "Kundan Kumar Jha", "4031", "CSE" },
            { "Anand Jha", "6014", "IT" }
        };
 
        // Column Names
        String[] columnNames = { "Name", "Roll Number", "Department" };
 
        // Initializing the JTable
        j = new JTable(data, columnNames);
        j.setBounds(30, 40, 200, 300);
 
        // adding it to JScrollPane
        JScrollPane sp = new JScrollPane(j);
        f.add(sp);
        // Frame Size
        f.setSize(500, 200);
        // Frame Visible = true
        f.setVisible(true);
    }
  }
}
