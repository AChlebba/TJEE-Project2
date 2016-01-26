package com.example.jeedemo.jaxrs;

import java.net.URISyntaxException;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.example.jeedemo.domain.*;
import com.example.jeedemo.service.*;

@Stateless
@Path("/playerr")
public class PlayerRest {
	
	@EJB
	private PersonManager personManager;

	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Person> getAll(){
		return personManager.getAllPersons();
	}
	
	
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	public Response add(
		@FormParam("firstName") String firstName,
		@FormParam("pin") String pin,
		@FormParam("registrationDate") Date registrationDate
	){
			Person person = new Person();
			
			person.setFirstName(firstName);
	 		person.setPin(pin);
	 		person.setRegistrationDate(registrationDate);
			
			personManager.addPerson(person);
			
			java.net.URI location;
			try {
				location = new java.net.URI("../player/showPlayers.jsp");
				return Response.temporaryRedirect(location).build();
			} catch (URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    return null;
	}
	
	
	@DELETE
	@Path("/delete/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void delete(
			@PathParam("id") long id
	){
		personManager.deletePerson(personManager.getPersonById(id));
	}
	
	@GET
	@Path("/show/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Person show(
			@PathParam("id") long id
	){
		return personManager.getPersonById(id);
	}
	
	@PUT
    @Path("/edit/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Person edit(
            	@PathParam("id") long id,
            	@FormParam("firstName") String firstName,
		@FormParam("pin") String pin,
		@FormParam("registrationDate") Date registrationDate)
    {
	 	Person person = new Person();
	
	 	person = personManager.getPersonById(id);
	 	person.setFirstName(firstName);
	 	person.setPin(pin);
	 	person.setRegistrationDate(registrationDate);
	 	
		personManager.editPerson(person);
		
	    return person;
    }
	
	
	
}
