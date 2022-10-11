require_relative "../config/environment"

RSpec.describe SlackService do
  subject { described_class }

  describe "the service exists" do
    it "doesn't return an error when initialized" do
      expect{ subject.new }.not_to raise_error
    end
  end

  describe "#send_message" do
    context "when successful" do
      let(:msg) { "Shantay you stay." }

      let(:successful_response) {
        {
          "ok"=>true,
          "channel"=>"C03B8JB6YRL",
          "ts"=>"1650061156.421139",
          "message"=> {
            "bot_id"=>"B03BT2GDK4L",
            "type"=>"message",
            "text"=>msg,
            "user"=>"U03BMRAC8JZ",
            "ts"=>"1650061156.421139",
            "app_id"=>"A03BQCX77LJ",
            "team"=>"T03B0KUDMAT",
            "bot_profile"=> {
              "id"=>"B03BT2GDK4L",
              "app_id"=>"A03BQCX77LJ",
              "name"=>"slack-channel-mute",
              "icons"=> {
                "image_36"=>"https://a.slack-edge.com/80588/img/plugins/app/bot_36.png",
                "image_48"=>"https://a.slack-edge.com/80588/img/plugins/app/bot_48.png",
                "image_72"=>"https://a.slack-edge.com/80588/img/plugins/app/service_72.png"
              },
              "deleted"=>false,
              "updated"=>1650059969,
              "team_id"=>"T03B0KUDMAT"
            }
          }
        }
      }

      it "responds to #send_message" do
        expect(subject).to respond_to(:send_message)
      end

      xit "returns a hash with OK status code" do
        # client.chat_postMessage(channel: '#general', text: 'Boop boop bee doop', as_user: true)
      end
    end
  end
end