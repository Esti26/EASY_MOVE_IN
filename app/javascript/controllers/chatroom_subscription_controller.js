import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    console.log(this.messagesTarget)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data)},
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    const messageContainer = document.createElement("div");
    messageContainer.innerHTML = data;

    const messageElement = messageContainer.querySelector(".message");

    if (messageElement.dataset.sender === "current_user") {
      messageElement.classList.add("sent");
      messageElement.classList.remove("received");
    } else {
      messageElement.classList.add("received");
      messageElement.classList.remove("sent");
    }

    this.messagesTarget.appendChild(messageElement);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }



  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
