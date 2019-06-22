let Chat = {
    init(socket) {
      let channel = socket.channel('chat:lobby', {})
      channel.join()
      this.listenForChats(channel)
    },
  
    listenForChats(channel) {
      document.getElementById('chat-form').addEventListener('submit', function(e){
        e.preventDefault()
  
        let userName = document.getElementById('user-name').value
        let userMsg = document.getElementById('user-msg').value
  
        channel.push('shout', {name: userName, body: userMsg})
  
        document.getElementById('user-name').value = ''
        document.getElementById('user-msg').value = ''
      })
  
      channel.on('shout', payload => {
        let chatBox = document.querySelector('#chat-box')
        let msgBlock = document.createElement('p')
  
        msgBlock.insertAdjacentHTML('beforeend', `${payload.name}: ${payload.body}`)
        chatBox.appendChild(msgBlock)
      })
    }
  }
  
  export default Chat