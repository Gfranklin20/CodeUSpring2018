/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codeu.controller;

import codeu.model.data.Activity;
import codeu.model.data.Message;
import codeu.model.store.basic.ActivityStore;
import codeu.model.store.basic.MessageStore;
import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

/**
 *
 * @author Agnieszka
 */
public class ActivityFeedTest {
    
    private ActivityFeedServlet activityFeedServlet;
    private HttpServletRequest mockRequest;
    private HttpServletResponse mockResponse; 
    private RequestDispatcher mockRequestDispatcher;

    @Before
    public void setup() {
        activityFeedServlet = new ActivityFeedServlet();
        mockRequest = Mockito.mock(HttpServletRequest.class);
        mockResponse = Mockito.mock(HttpServletResponse.class);
        mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
        Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/activityfeed.jsp"))
        .thenReturn(mockRequestDispatcher);
    }
    
    @Test
    public void testDoGet() throws IOException, ServletException {
        ActivityStore mockActivityStore = Mockito.mock(ActivityStore.class);
        List<Activity> act = new ArrayList<Activity>();
        Mockito.when(mockActivityStore.getAllActivities()).thenReturn(act);
        activityFeedServlet.setActivityStore(mockActivityStore);
        activityFeedServlet.doGet(mockRequest, mockResponse);
        Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
    }
    
    @Test
    public void testGetMultipleActivities(){
        ActivityStore activityStore = ActivityStore.getInstance();
        List<Message> message = new ArrayList<Message>();
        Instant older = Instant.now();
        Instant newest = older.plusSeconds(1);
        message.add(new Message(UUID.randomUUID(), UUID.randomUUID(), UUID.randomUUID(), "Test1", older));
        message.add(new Message(UUID.randomUUID(), UUID.randomUUID(), UUID.randomUUID(), "Test2", newest));
        MessageStore mockMessageStore = Mockito.mock(MessageStore.class);
        Mockito.when(mockMessageStore.getAll()).thenReturn(message);
        activityStore.setMessageStore(mockMessageStore);
        
        List<Activity> act = activityStore.getAllActivities();
        
        Mockito.verify(mockMessageStore).getAll();
        Assert.assertEquals(2, act.size());
        Assert.assertEquals(newest, act.get(0).creationTime);
    }

}
