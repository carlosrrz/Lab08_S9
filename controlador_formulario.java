import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegistrarReserva")
public class RegistrarReservaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén los parámetros del formulario HTML
        String nombreCliente = request.getParameter("nombreCliente");
        String fechaReserva = request.getParameter("fechaReserva");
        int numeroPersonas = Integer.parseInt(request.getParameter("numeroPersonas"));

        // Define la URL de la base de datos PostgreSQL
        String dbURL = "jdbc:postgresql://localhost:5432/PG01";
        String user = "posgres";
        String password = "12345678";

        try {
            // Establece la conexión con la base de datos
            Connection connection = DriverManager.getConnection(dbURL, user, password);

            // Crea la consulta SQL para insertar la reserva
            String insertQuery = "INSERT INTO Reserva (nombreCliente, fechaReserva, numeroPersonas) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, nombreCliente);
            preparedStatement.setString(2, fechaReserva);
            preparedStatement.setInt(3, numeroPersonas);

            // Ejecuta la consulta SQL
            preparedStatement.executeUpdate();

            // Cierra la conexión
            connection.close();

            // Redirige a una página de éxito
            response.sendRedirect("exito.html");
        } catch (SQLException e) {
            e.printStackTrace();

            // Redirige a una página de error en caso de fallo
            response.sendRedirect("error.html");
        }
    }
}
