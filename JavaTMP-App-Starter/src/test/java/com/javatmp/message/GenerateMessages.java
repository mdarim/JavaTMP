/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.message;

import com.javatmp.module.message.entity.Message;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.repository.UserRepository;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author JavaTMP
 */
public class GenerateMessages {

    MessageService messageService;
    UserRepository userRepository;

    public void main() {
        List<User> users = userRepository.findAll();
        generateMessages(messageService, users);
    }

    public static void generateMessages(MessageService messageService, List<User> users) {
        Long counter = 0L;
        Random rand = new Random();

        for (int i = 0; i < users.size(); i++) {
            Long from = users.get(i).getId();
            // get random to:
            System.out.println("From i [" + from + "]");
            for (int j = 0; j < 5; j++) {
                int randomTo = 0;
                while ((randomTo = rand.nextInt(users.size())) == i);
//                logger.info("i[" + i + "] => random to is [" + randomTo + "]");
                Long to = users.get(randomTo).getId();
                Message message = new Message();
                message.setFromUserId(from);
                message.setToUserId(to);
                message.setMessageStatus((short) 1);
                message.setMessageTitle("Fake Message number " + (++counter));

                message.setMessageContentText("<p>A fake data summary text to show you number " + (counter) + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>");

                Calendar calendar = Calendar.getInstance();
                int randomDayOfMonth = ThreadLocalRandom.current().nextInt(31);
                calendar.add(Calendar.DAY_OF_MONTH, randomDayOfMonth * -1);
                if (randomDayOfMonth != 0) {
                    calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(24));
                    calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(60));
                    calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(60));
                    calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(1000));
                } else {
                    int value = 0;
                    value = calendar.get(Calendar.HOUR_OF_DAY);
                    calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.MINUTE);
                    calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.SECOND);
                    calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.MILLISECOND);
                    calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                }

                message.setCreationDate(calendar.getTime());
                messageService.save(message);
            }
        }
    }
}
