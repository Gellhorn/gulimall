package com.atuigu.rabbitmq.spring;

import com.alibaba.fastjson.JSON;
import com.rabbitmq.client.AMQP;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description 消息发送确认
 * <p>
 * ConfirmCallback  只确认消息是否正确到达 Exchange 中
 * ReturnCallback   消息没有正确到达队列时触发回调，如果正确到达队列不执行
 * <p>
 * 1. 如果消息没有到exchange,则confirm回调,ack=false
 * 2. 如果消息到达exchange,则confirm回调,ack=true
 * 3. exchange到queue成功,则不回调return
 * 4. exchange到queue失败,则回调return
 * @Author qy
 */
@Configuration
@Slf4j
public class ProducerAckConfig implements RabbitTemplate.ConfirmCallback, RabbitTemplate.ReturnCallback {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @PostConstruct
    public void init() {
        rabbitTemplate.setConfirmCallback(this);            //指定 ConfirmCallback
        rabbitTemplate.setReturnCallback(this);             //指定 ReturnCallback
    }

    /**
     * 确认消息是否正确到达 Exchange 中
     *
     * @param correlationData
     * @param ack
     * @param cause
     */
    @Override
    public void confirm(CorrelationData correlationData, boolean ack, String cause) {
        if (ack) {
            log.info("消息发送成功：" + JSON.toJSONString(correlationData));
        } else {
            log.info("消息发送失败：{} 数据：{}", cause, JSON.toJSONString(correlationData));
        }
    }

    /**
     * 消息没有正确到达队列时触发回调，如果正确到达队列不执行
     *
     * @param message
     * @param replyCode
     * @param replyText
     * @param exchange
     * @param routingKey
     */
    @Override
    public void returnedMessage(Message message, int replyCode, String replyText, String exchange, String routingKey) {
        // 反序列化对象输出
        System.out.println("消息主体: " + new String(message.getBody()));
        System.out.println("应答码: " + replyCode);
        System.out.println("描述：" + replyText);
        System.out.println("消息使用的交换器 exchange : " + exchange);
        System.out.println("消息使用的路由键 routing : " + routingKey);
    }

//    /**
//     * 声明业务交换机
//     *
//     * @return
//     */
//    @Bean
//    public TopicExchange topicExchange() {
//        return new TopicExchange("spring.test.exchange", true, false);
//    }
//
//    /**
//     * 声明业务队列
//     * 并把死信交换机绑定到业务队列
//     * @return
//     */
//    @Bean
//    public Queue queue() {
//        Map<String, Object> arguments = new HashMap<>();
////         x-dead-letter-exchange    这里声明当前队列绑定的死信交换机
//        arguments.put("x-dead-letter-exchange", "dead-exchange");
////         x-dead-letter-routing-key  这里声明当前队列的死信路由key
//        arguments.put("x-dead-letter-routing-key", "msg.dead");
//        return new Queue("spring.test.queue", true, false, false, arguments);
//    }
//
//    /**
//     * 业务队列绑定到业务交换机
//     *
//     * @return
//     */
//    @Bean
//    public Binding binding() {
//        return new Binding("spring.test.queue", Binding.DestinationType.QUEUE, "spring.test.exchange", "a.b", null);
//    }
//
//    /**
//     * 声明死信交换机
//     * @return
//     */
//    @Bean
//    public TopicExchange deadExchange(){
//        return new TopicExchange("dead-exchange", true, false);
//    }
//
//    /**
//     * 声明死信队列
//     * @return
//     */
//    @Bean
//    public Queue deadQueue(){
//        return new Queue("dead-queue", true, false, false);
//    }
//
//    /**
//     * 把死信队列绑定到死信交换机
//     * @return
//     */
//    @Bean
//    public Binding deadBinding() {
//        return new Binding("dead-queue", Binding.DestinationType.QUEUE, "dead-exchange", "msg.dead", null);
//    }

}
