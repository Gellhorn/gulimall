package com.atguigu.rabbitmq.spring;

import com.atuigu.rabbitmq.spring.Application;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class MqDemo {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Test
    public void testSend() throws IOException {
        String msg = "hello, Spring boot amqp";
        this.rabbitTemplate.convertAndSend("spring.test.exchange","a.b", msg);
        // 程序阻塞，等待消息别接受
        System.in.read();
    }

}
