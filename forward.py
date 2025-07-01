from telethon import TelegramClient, events
import asyncio
import sys
import os

# Replace with your actual credentials during runtime via sed in bash
api_id = int(APP_ID_REPLACE)
api_hash = "APP_HASH_REPLACE"

client = TelegramClient('forward_session', api_id, api_hash)

async def login_flow(phone):
    try:
        await client.start(phone)
        print("✅ Telegram Connected Successfully!")
    except Exception as e:
        print(f"❌ Login failed: {e}")
    finally:
        await client.disconnect()

async def forward_messages(source_id, target, msg_id):
    await client.start()
    print(f"\n🔁 Forwarding messages from [ID {msg_id}]...\n")

    try:
        async for message in client.iter_messages(source_id, min_id=int(msg_id), reverse=True):
            if message.media:
                try:
                    await client.send_message(target, message)
                    print(f"✅ Forwarded message ID: {message.id}")
                except Exception as e:
                    print(f"❌ Failed to forward message ID {message.id}: {e}")
            await asyncio.sleep(1)
    except Exception as e:
        print(f"⚠️ Error fetching messages: {e}")
    finally:
        print("\n🎉 Forwarding Complete!")
        await client.disconnect()

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("❗Usage:")
        print("   python3 forward.py login <phone>")
        print("   python3 forward.py forward <source_chat_id> <target_chat> <start_msg_id>")
        sys.exit(1)

    command = sys.argv[1].lower()

    with client:
        if command == "login":
            phone = sys.argv[2]
            client.loop.run_until_complete(login_flow(phone))
        elif command == "forward":
            source = int(sys.argv[2])
            target = sys.argv[3]
            msg_id = int(sys.argv[4])
            client.loop.run_until_complete(forward_messages(source, target, msg_id))
        else:
            print("❌ Unknown command.")
