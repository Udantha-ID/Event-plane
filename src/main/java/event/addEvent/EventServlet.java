package event.addEvent;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/EventsServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EventDBUtil eventDBUtil;

	public EventServlet() {
		super();
		this.eventDBUtil = new EventDBUtil();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/event_new":
				showNewEventForm(request, response);
				break;
			case "/event_insert":
				insertEvent(request, response);
				break;
			case "/event_delete":
				deleteEvent(request, response);
				break;
			case "/event_edit":
				showEditEventForm(request, response);
				break;
			case "/event_update":
				updateEvent(request, response);
				break;
			case "/event_view":
				viewEvents(request, response);
				break;
			default:
				listEvents(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void showNewEventForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("eventForm.jsp");
		dispatcher.forward(request, response);
	}

	private void insertEvent(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String name = request.getParameter("name"); // Use "name" instead of "title"
		String type = request.getParameter("type"); // Use "type" instead of "genre"
		String eventDate = request.getParameter("eventDate"); // Use "eventDate" instead of "releaseDate"
		String organizer = request.getParameter("organizer"); // Use "organizer" instead of "director"
		String description = request.getParameter("description");

		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + File.separator + "images";

		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		String imageUrl = "";
		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);
			if (!fileName.equals("")) {
				part.write(savePath + File.separator + fileName);
				imageUrl = "images" + File.separator + fileName;
			}
		}

		Event newEvent = new Event(name, type, eventDate, organizer, description, imageUrl);
		eventDBUtil.insertEvent(newEvent);
		response.sendRedirect("event_list");
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	private void deleteEvent(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		eventDBUtil.deleteEvent(id);
		response.sendRedirect("event_list");
	}

	private void showEditEventForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Event existingEvent = eventDBUtil.selectEvent(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("eventForm.jsp");
		request.setAttribute("event", existingEvent);
		dispatcher.forward(request, response);
	}

	private void updateEvent(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name"); // Use "name" instead of "title"
		String type = request.getParameter("type"); // Use "type" instead of "genre"
		String eventDate = request.getParameter("eventDate"); // Use "eventDate" instead of "releaseDate"
		String organizer = request.getParameter("organizer"); // Use "organizer" instead of "director"
		String description = request.getParameter("description");

		Part filePart = request.getPart("image");
		String fileName = extractFileName(filePart);

		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + File.separator + "images";

		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		String imageUrl = "";
		if (!fileName.isEmpty()) {
			String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
			String filePath = savePath + File.separator + uniqueFileName;
			filePart.write(filePath);
			imageUrl = "/images/" + uniqueFileName;
		} else {
			imageUrl = request.getParameter("imageUrl");
		}

		Event updatedEvent = new Event(id, name, type, eventDate, organizer, description, imageUrl);
		eventDBUtil.updateEvent(updatedEvent);
		response.sendRedirect("event_list");
	}

	private void listEvents(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Event> listEvents = eventDBUtil.selectAllEvents();
		request.setAttribute("listEvents", listEvents);
		RequestDispatcher dispatcher = request.getRequestDispatcher("eventList.jsp");
		dispatcher.forward(request, response);
	}

	private void viewEvents(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Event> listEvents = eventDBUtil.selectAllEvents();
		request.setAttribute("listEvents", listEvents);
		RequestDispatcher dispatcher = request.getRequestDispatcher("events.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
