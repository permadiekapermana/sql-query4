package com.permadi;

//import java sql semua package
import java.sql.*;

public class DatabaseAkses {
	
	//	var koneksi, statement, resultset	
	private static Connection con = null;
	private static Statement st = null;
	private static ResultSet rs = null;
		
	//	method database akses	
	public DatabaseAkses() {
		//	url localhost, port mysql, database		
		String url = "jdbc:mysql://localhost:3306/query_latihan4";
		//	username localhost		
		String user = "root";
		//	password localhost		
		String password = "";
		//	exception koneksi		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {			
			System.out.println(e);
		}
	}
	
	//	method view / select data tabel	
	public static void view1() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT ruangan.No_Ruangan, ruangan.Nama_Ruangan FROM `ruangan` "
				+ "INNER JOIN jadwal ON ruangan.No_Ruangan=jadwal.No_Ruangan "
				+ "WHERE ruangan.No_Ruangan NOT IN (SELECT No_Ruangan FROM jadwal WHERE hari=1 AND "
				+ "Jam_Mulai='10:00:00' AND Jam_Selesai='11:40:00')");
		
		System.out.println("Menampilkan Ruangan yang kosong pada Hari “Senin” jam 10:00 – 11:40");
		
		
		while(rs.next()) {
			System.out.println("\nNomor Ruangan : " + rs.getString(1));
			System.out.println("Ruangan : " + rs.getString(2));
		}
	}
	
	//	method view / select data tabel	
	public static void view2() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT jadwal.hari, jadwal.Jam_Mulai, jadwal.Jam_Selesai, matakuliah.Kd_matakuliah, "
				+ "matakuliah.Nama_Matakuliah, dosen.Kd_dosen, dosen.Nama "
				+ "FROM jadwal INNER JOIN matakuliah ON jadwal.Kd_matakuliah=matakuliah.Kd_matakuliah "
				+ "INNER JOIN dosen ON jadwal.Kd_Dosen=dosen.Kd_dosen");
		
		System.out.println("");
		
		
		while(rs.next()) {
			System.out.println("\nHari : " + rs.getString(1));
			System.out.println("Jam Mulai : " + rs.getString(2));
			System.out.println("Jam Selesai : " + rs.getString(3));
			System.out.println("Kode Mata Kuliah : " + rs.getString(4));
			System.out.println("Nama Mata Kuliah : " + rs.getString(5));
			System.out.println("Kode Dosen : " + rs.getString(6));
			System.out.println("Nama Dosen : " + rs.getString(7));
		}
	}
	
	//	method view / select data tabel	
	public static void view3() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT DISTINCT dosen.Kd_Dosen, dosen.Nama FROM dosen "
				+ "INNER JOIN jadwal ON dosen.Kd_dosen=jadwal.Kd_Dosen "
				+ "WHERE dosen.Kd_dosen IN (SELECT Kd_dosen FROM jadwal WHERE Jam_Mulai='08:00:00' AND Jam_Selesai='09:40:00')");
		
		System.out.println("Menampilkan Dosen yang mengajar di Jam 08:00 – 9:40");
		
		
		while(rs.next()) {
			System.out.println("\nKode Dosen : " + rs.getString(1));
			System.out.println("Nama Dosen : " + rs.getString(2));
		}
	}
	
	//	method view / select data tabel	
	public static void view4() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT DISTINCT dosen.Kd_Dosen, dosen.Nama FROM dosen "
				+ "INNER JOIN jadwal ON dosen.Kd_dosen=jadwal.Kd_Dosen WHERE dosen.Kd_dosen "
				+ "IN (SELECT Kd_dosen FROM jadwal WHERE hari=1) AND dosen.Kd_dosen IN (SELECT Kd_dosen FROM jadwal WHERE hari=3)");
		
		System.out.println("Menampilkan Dosen yang mengajar di hari Senin dan Rabu.");
		
		
		while(rs.next()) {
			System.out.println("\nKode Dosen : " + rs.getString(1));
			System.out.println("Nama Dosen : " + rs.getString(2));
		}
	}
	
	//	method view / select data tabel	
	public static void view5() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT DISTINCT dosen.Kd_Dosen, dosen.Nama FROM dosen "
				+ "INNER JOIN jadwal ON dosen.Kd_dosen=jadwal.Kd_Dosen WHERE dosen.Kd_dosen "
				+ "NOT IN (SELECT Kd_dosen FROM jadwal WHERE hari=3)");
		
		System.out.println("Menampilkan Dosen yang tidak mengajar di hari Rabu");
		
		
		while(rs.next()) {
			System.out.println("\nKode Dosen : " + rs.getString(1));
			System.out.println("Nama Dosen : " + rs.getString(2));
		}
	}
	
	//	method view / select data tabel	
	public static void view6() throws SQLException {
		st = con.createStatement();
		rs = st.executeQuery("SELECT ruangan.No_Ruangan, ruangan.Nama_Ruangan FROM `ruangan` "
				+ "INNER JOIN jadwal ON ruangan.No_Ruangan=jadwal.No_Ruangan WHERE ruangan.No_Ruangan "
				+ "NOT IN (SELECT No_Ruangan FROM jadwal WHERE hari=2)");
		
		System.out.println("Menampilkan List ruangan yang tidak dipakai dari hari Selasa");
		
		
		while(rs.next()) {
			System.out.println("\nNomor Ruangan : " + rs.getString(1));
			System.out.println("Ruangan : " + rs.getString(2));
		}
	}
	
	
}
































